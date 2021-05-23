module PostSupport
  def post(tip)
    click_on '新規投稿'
    fill_in 'tip_title', with: tip.title
    fill_in 'tip_name',  with: @tag.name
    select Category.data[tip.category_id - 1][:name], from: 'tip_category_id'
    image_path = Rails.root.join('public/images/test_image.png')
    attach_file 'tip-image-main-img', image_path, make_visible: true
    fill_in 'tip_description', with: tip.description
    expect  do
      find('input[type="submit"]').click
    end.to change(Tip, :count).by(1)
    expect(current_path).to eq root_path
    expect(page).to have_content(tip.title)
    expect(page).to have_content(@tag.name)
    expect(page).to have_content(Category.data[tip.category_id - 1][:name])
    expect(page).to have_content(tip.description)
    expect(page).to have_selector('img')
  end
end
