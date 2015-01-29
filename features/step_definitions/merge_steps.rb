Given /^the following articles exist$/ do |table|
  article = Article.create! table.hashes
end

Then /^the article "(.*?)" should have body "(.*?)"$/ do |title, body|
  Article.find_by_title(title).body.should eq body
end

Given /^(?:|I )fill in "(.*?)" with id for article "(.*?)"$/ do |field, title|
  article = Article.find_by_title title
  fill_in(field, :with => article.id)
end

Given /^the following comments for article "(.*?)" exist$/ do |title, table|
  article = Article.find_by_title title

  table.hashes.each do |record|
    article.comments.create! record
  end
end

Then /^all comments from "(.*?)" should be linked to "(.*?)"$/ do |title_from, title_to|
  article_from = Article.find_by_title title_from
  article_to = Article.find_by_title title_to

  article_from.comments.count.should eq 0
  article_to.comments.count.should eq 4
end
