class SectionController < ApplicationController
  before_action :authenticate_user!
  before_action :set_section, only: %i[edit create update]

  def new
    @section = Section.new
    authorize @section
  end

  def edit
    authorize @section
  end

  def create
    @section = Section.new(section_params)
    authorize @section

    if @section.save
      redirect_to @merchant, notice: 'La seccion se creó correctamente.'
    else
      render :new
    end
  end

  def update
    authorize @section
    if @section.update(section_params)
      redirect_to @merchant, notice: 'La seccion se actualizó correctamente.'
    else
      render :edit
    end
  end

  private

  def merchant
    @merchant ||= Merchant.includes(:keywords).friendly.find(params[:merchant_id])
  end

  def set_section
    @section = merchant.find(id)
  end

  def section_params
    params.require(:section).permit(:name, :position)
  end
end
