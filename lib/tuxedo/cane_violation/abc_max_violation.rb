module Tuxedo
  class CaneViolation
    class AbcMaxViolation < CaneViolation
      attr_accessor :file_name, :detail, :complexity
      attr_accessor :class_name, :method_name, :expression

      def self.from_cane(cane_violation)
        violation = new

        violation.file_name  = cane_violation.file_name
        violation.detail     = cane_violation.detail
        violation.complexity = cane_violation.complexity

        parts = violation.detail.split(" > ")
        violation.class_name  = parts[-2]
        violation.method_name = parts[-1]
        violation.expression  = parts[0..-2].join("::") + "." + parts[-1]

        violation
      end

      def description
        "Methods exceeded maximum allowed ABC complexity"
      end

      def to_hash
        {
          :violation_type => violation_type,
          :file_name      => file_name,
          :detail         => detail,
          :complexity     => complexity,
          :description    => description,
        }
      end
    end
  end
end
