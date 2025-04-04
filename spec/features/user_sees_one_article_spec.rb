require 'rails_helper'

describe "user sees one article", type: :feature do
  describe "they click a link from articles index" do
    it 'takes them to a new page showing one article' do
      article = Article.create!(title: "New Title", body: "New Body")
      comment_1 = article.comments.create(author_name: "Me", body: "Commenty comments")
      comment_2 = article.comments.create(author_name: "You", body: "So much to say")
      
      visit articles_path
      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end