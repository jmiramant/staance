require 'spec_helper'

describe Topic do
  it "adds a topic to the Topic database" do
    topic = Topic.create(title: "First Topic")
    expect(Topic.first).to eq topic
  end

  it "doesn't add a topic that already exists" do
    topic = Topic.create(title: "First Topic")
    topic2 = Topic.new(title: "First Topic")
    expect(topic2.valid?).to be_false
  end
end
