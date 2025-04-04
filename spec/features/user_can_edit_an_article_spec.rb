require 'rails_helper'

describe "user creates a new article", type: :feature do
  it '' do
    article = Article.create!(title: "happy title", body: 'happy body')

    visit article_path(article)
    click_link "Edit"
    expect(current_path).to eq(edit_article_path(article))

    fill_in "article[title]", with: "New Title!"
    fill_in "article[body]", with: "New Body!"
    click_on "Update Article"
    
    expect(current_path).to eq(article_path(article))
    expect(page).to have_content("New Title!")
    expect(page).to have_content("New Body!")
    expect(page).to have_content("Article 'New Title!' Updated!")
  end
end