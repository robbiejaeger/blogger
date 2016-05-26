class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    # Should we be deleting the tagging too?
    # Right now, article.taggings still has the old tagging from a tag that has been deleted
    flash.notice = "Tag '#{@tag.name}' Deleted!"

    redirect_to tags_path
  end
end
