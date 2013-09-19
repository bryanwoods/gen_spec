require "gen_spec/version"
require File.join(File.dirname(__FILE__), 'gen_spec', 'types')
require "active_support/inflector"

module GenSpec
  TRIES = 100

  def gen_spec(meth, desc)
    yield

    TRIES.times do
      @result = send(meth, *@inputs.call)
      return false if failed?
    end

    valid?
  end

  def result
    @result
  end

  def inputs(&block)
    classes = instance_eval(&block)

    @inputs = -> do
      classes.split(", ").map do |klass|
        "GenSpec::#{klass}".constantize.send(:generated_value)
      end
    end
  end

  def validator(&block)
    @validator = -> { instance_eval(&block) }
  end

  def valid?
    @validator.call
  end

  def failed?
    !valid?
  end
end

include GenSpec
