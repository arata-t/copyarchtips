module SignInSupport
  def sign_in(_user)
    visit new_user_session_path
    fill_in 'user_email', with: @tip.user.email
    fill_in 'user_password', with: @tip.user.password
    find('input[type="submit"]').click
    expect(current_path).to eq(root_path)
    expect(page).to have_content('新規投稿')
  end
end
