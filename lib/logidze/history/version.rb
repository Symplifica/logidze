# frozen_string_literal: true

module Logidze
  class History
    # Represents one log item
    class Version
      # Timestamp key
      TS = "ts"
      # Changes key
      CHANGES = "c"
      # Responsible ID
      RESPONSIBLE = "r"
      # Meta Responsible ID
      META_RESPONSIBLE = "_r"
      # Meta key
      META = "m"
      # Meta Responsible Kind
      META_RESPONSIBLE_KIND = "_rk"
      # Responsible Kind
      RESPONSIBLE_KIND = "rk"

      attr_reader :data

      def initialize(data)
        @data = data
      end

      def version
        data.fetch(VERSION)
      end

      def changes
        data.fetch(CHANGES)
      end

      def time
        data.fetch(TS)
      end

      def responsible_id
        meta && meta[META_RESPONSIBLE] || data[RESPONSIBLE]
      end

      def responsible_kind
        meta && meta[META_RESPONSIBLE_KIND] || data[RESPONSIBLE_KIND]
      end

      def meta
        data[META]
      end
    end
  end
end
