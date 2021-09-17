class UploadersController < ApplicationController
  before_filter :require_login!
  def index
    @uploaders = current_user.uploaders
    @tags = current_user.uploaders.pluck(:tags)
    if @tags.present?
      @concatenated = @tags.flatten.uniq
    else
      @concatenated = nil
    end
    # concatenated.each do |tag|
    #   return render json: tag
    # end
  end

  def new
    @uploader = Uploader.new   
  end

  def filter
    tags_data = current_user.uploaders.select { |m| m.tags.include? params[:tag] }
    return render json: tags_data
  end

  def create
    # return render plain: params
    @uploader = Uploader.new(uploader_params)   
         @uploader.user_id = current_user.id
         if params[:uploader][:tags] != ''
          tags = params[:uploader][:tags].split(',')
        else
          tags = nil
         end
         @uploader.tags = tags
      if @uploader.save   
         redirect_to uploaders_index_path, notice: "Successfully uploaded."   
      else   
         render "new"   
      end  
  end

  def destroy
    @uploader = Uploader.find(params[:id])   
      @uploader.destroy   
      redirect_to uploaders_path, notice:  "Successfully deleted."   
  end

  private   
  def uploader_params   
  params.require(:uploader).permit(:title,:description, :attachment)   
end   
end
