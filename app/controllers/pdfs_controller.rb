class PdfsController < ApplicationController

  def index
  	@pdfs = Pdf.all
  end

  def show
    @pdf = Pdf.find(params[:id])
  end

  def new
  	@pdf = Pdf.new
  end

  def create
  	@pdf = Pdf.new (pdf_params)
  	if @pdf.save
      pdf_root = "#{Rails.root}/public#{@pdf.attachment.url}"
      pd = Grim.reap(pdf_root)
      count = 1
      pd.each do |page|
        pdf_image = "#{Rails.root}/public/uploads/pdf/attachment/#{@pdf.id}/"
        page.save("#{pdf_image}page#{count}.png")
        img = Image.create(path: "/uploads/pdf/attachment/#{@pdf.id}/page#{count}.png" )
        @pdf.images << img
        count = count + 1
      end
  		redirect_to pdfs_path, notice: "the pdf #{@pdf.name} has been uploaded"
  	else
  		render "new"
  	end
  end

  def destroy
      @pdf = Pdf.find(params[:id])
      @pdf.destroy
      redirect_to pdfs_path, notice: "The pdf #{@pdf.name} has been deleted"
  end


  private
  def pdf_params
  	params.require(:pdf).permit(:name,:attachment)
  end
end
