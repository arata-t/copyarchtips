module MypageSupport
  def mypage(_user)
    expect(current_path).to eq user_path(@tip.user.id)
    expect(page).to have_content(@tip.user.nickname)
    expect(page).to have_content(@tip.description)
    expect(page).to have_content(@tip.user.tips.length)
    expect(page).to have_content(@tip.title)
    expect(page).to have_content(Category.data[@tip.category_id - 1][:name])
    expect(page).to have_content(@tip.description)
    expect(page).to have_selector('img')
  end
end
