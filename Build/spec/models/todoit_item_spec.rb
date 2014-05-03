require 'spec_helper'

describe TodoitItem do
  it { should belong_to (:todoit_list)}
end
