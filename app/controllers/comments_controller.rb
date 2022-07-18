class CommentsController < ApplicationController
  
    def create
        @comment = current_user.comments.new(comment_params)
        if !@comment.save
            flash[:notice] = @comment.errors.full_messages.to_sentence
        end
        redirect_to image_path(params[:image_id])
    end

    def destroy
      @image = Image.find(params[:image_id])
      @comment = @image.comments.find(params[:id])
      @comment.destroy
      redirect_to image_path(@image)
    end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:content, :parent_id)
      .merge(image_id: params[:image_id])
  end
end
