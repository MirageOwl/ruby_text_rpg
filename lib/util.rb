class Hash
  def symbolize_keys
    transform_keys(&:to_sym)
  end
end

CLI::UI::StdoutRouter.enable
class String
  def cli
    CLI::UI::fmt self
  end
end
