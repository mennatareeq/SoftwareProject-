class ImagesController < ApplicationController

  def show
    @image = Image.find(params[:id])
  end
def comment
#images = Image.find(params[:id])
 # comment= images.comments.create
  #comment.title = "First comment"
#comment.comment = "This is the first comment"
#comment.save

commentable = Image.find(params[:id])
comment = commentable.comments.create
comment.title = params[:title]
comment.comment = params[:comment]
comment.user=@log
comment.save
redirect_to image_url(commentable)
end

  
end
