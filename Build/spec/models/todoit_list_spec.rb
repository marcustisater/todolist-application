require 'spec_helper'

describe TodoitList do
  it { should have_many(:todoit_items)}
end
