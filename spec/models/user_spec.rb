require 'spec_helper'

describe User do

  context "create" do
    it "adds user to user database" do
      user = create(:user)
      expect(User.first).to eq user
    end

    it "doesn't add user if passwords don't match" do
      user = build(:user,
        password: "password",
        password_confirmation: "passwrod"
      )
      expect(user.valid?).to be_false
    end

    it "doesn't add user if email is not unique" do
      user = create(:user, email: "foo@example.com")
      user2 = build(:user, email: "foo@example.com")
      expect(user2.valid?).to be_false
    end

  end
end
