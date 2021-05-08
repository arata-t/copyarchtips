module ShowSupport
  def show(_tip)
    expect(page).to have_content(@tip.title)
    expect(page).to have_content(@tag.name)
    expect(page).to have_content(Category.data[@tip.category_id - 1][:name])
    expect(page).to have_content(@tip.description)
    expect(page).to have_selector('img')
  end
end
