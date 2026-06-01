# frozen_string_literal: true

class Code
  module Network
    BLOCKED_HOSTS = %w[
      localhost
      localhost.localdomain
    ].freeze
    BLOCKED_HOST_SUFFIXES = %w[
      .local
      .localhost
    ].freeze
    BLOCKED_IP_RANGES = [
      "0.0.0.0/8",
      "10.0.0.0/8",
      "100.64.0.0/10",
      "127.0.0.0/8",
      "169.254.0.0/16",
      "172.16.0.0/12",
      "192.0.0.0/24",
      "192.168.0.0/16",
      "224.0.0.0/4",
      "240.0.0.0/4",
      "::/128",
      "::1/128",
      "64:ff9b::/96",
      "64:ff9b:1::/48",
      "2002::/16",
      "fc00::/7",
      "fe80::/10",
      "ff00::/8"
    ].map { |range| IPAddr.new(range) }.freeze

    def self.validate_public_uri!(uri, service:)
      unless %w[http https].include?(uri.scheme)
        raise Error, "#{service}: unsupported url scheme"
      end

      validate_public_host!(uri.hostname, service: service).first
    end

    def self.validate_public_host!(host, service:)
      normalized_host = normalize_host(host)

      if blocked_hostname?(normalized_host)
        raise Error, "#{service}: local network requests are not allowed"
      end

      addresses = resolved_addresses(normalized_host)
      raise Error, "#{service}: could not resolve host" if addresses.empty?

      if addresses.any? { |address| blocked_address?(address) }
        raise Error, "#{service}: local network requests are not allowed"
      end

      addresses
    rescue Resolv::ResolvError, ArgumentError
      raise Error, "#{service}: could not resolve host"
    end

    def self.blocked_address?(address)
      ip = IPAddr.new(address)
      ip = ip.native if ip.respond_to?(:ipv4_mapped?) && ip.ipv4_mapped?
      ip = ip.native if ip.respond_to?(:ipv4_compat?) && ip.ipv4_compat?

      BLOCKED_IP_RANGES.any? { |range| range.include?(ip) }
    end

    def self.resolved_addresses(host)
      [IPAddr.new(host).to_s]
    rescue ArgumentError
      Resolv.getaddresses(host)
    end

    def self.normalize_host(host)
      normalized_host = host.to_s.downcase.delete_suffix(".")
      raise Error, "network: invalid host" if normalized_host.blank?

      normalized_host
    end

    def self.blocked_hostname?(host)
      BLOCKED_HOSTS.include?(host) ||
        BLOCKED_HOST_SUFFIXES.any? { |suffix| host.end_with?(suffix) }
    end
  end
end
