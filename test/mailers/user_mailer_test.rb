require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "registration" do
    # Create the Request
    request = Request.new(name: "tot", email: "tot@tot", phone_number: "555", biography: "dodo")
    request.set_confirmation_token
    request.save
    # Create the email and store it for further assertions
    email = UserMailer.registration_confirmation(request)

    # Send the email, then test that it got queued
    assert_emails 1 do
      email.deliver_now
    end

    # Test the body of the sent email contains what we expect it to
    assert_equal ['bricecoworking@gmail.com'], email.from
    assert_equal ['tot@tot'], email.to
    assert_equal 'Registration Confirmation for Coworking', email.subject
  end
end
