module SessionsHelpers
  def login_user(user = FactoryBot.create(:user))
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end
end
