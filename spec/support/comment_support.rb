module CommentSupport
  def comment(_comment)
    fill_in 'comment_comment', with: @comment.comment
    expect  do
      find('input[name="commit"]').click
    end.to change(Comment, :count).by(1)
    expect(current_path).to eq tip_path(@tip)
    expect(page).to have_content @comment.user.nickname
    expect(page).to have_content @comment.comment
  end
end
