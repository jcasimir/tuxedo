module StyleStyle
  class Runner
    def self.run_cane(path="**")
      output = `cane --style-glob #{path}/*.rb`
    end
    def self.run_reek
      # "reek . 2>&1"
      output = `reek -qy .`
      StyleStyle::ReekParser.parse_reek(output)
    end
  end
end