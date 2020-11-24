# frozen_string_literal: true

class SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant
  before_action :set_section, only: %i[edit update destroy]

  def index
    @sections = @merchant.menu.sections
    authorize @sections
  end

  def new
    @section = Section.new
    authorize @section
  end

  def edit
    authorize @section
  end

  def create
    @section = Section.new(section_params)
    @section.menu = @merchant.menu
    authorize @section

    if @section.save
      redirect_to @merchant, notice: 'La sección se creó correctamente.'
    else
      render :new
    end
  end

  def update
    authorize @section
    if @section.update(section_params)
      redirect_to @merchant, notice: 'La sección se actualizó correctamente.'
    else
      render :edit
    end
  end

  def sort
    Section.transaction do
      sorted_params[:sections].each do |item|
        Section.where(id: item[:id]).update(position: item[:position])
      end
    end
    render json: {}, status: :ok
  end

  def destroy
    authorize @section
    @section.destroy
    redirect_to @merchant, notice: 'La sección se eliminó correctamente.'
  end

  private

  def set_merchant
    @merchant = Merchant.friendly.find(params[:merchant_id])
  end

  def set_section
    @section = @merchant.menu.sections.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:name, :position)
  end

  def sorted_params
    params.require(:sorted).permit(sections: %i[id position])
  end
end
