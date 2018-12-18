class Admin::TagsController < Admin::ApplicationController
  def index
    @of_tags = Tag.where(official: true)
    @tags = Tag.where(official: false)
    @tag = Tag.new
  end


  def create
    @tag = Tag.new(admin_tag_params)
    if @tag.save
      redirect_to admin_tags_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to :back
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to :back
  end

  private
  def admin_tag_params
    params.require(:tag).permit(
      :name
      ).merge(official: true)
  end
end
