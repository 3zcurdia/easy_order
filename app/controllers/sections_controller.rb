# frozen_string_literal: true

class SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant
  before_action :set_section, only: %i[edit update destroy]

  def index
    authorize(Section)
    @sections = @merchant.menu.sections
  end

  def new
    @section = authorize(Section.new)
  end

  def edit; end

  def create
    @section = authorize(Section.new(section_params))
    @section.menu = @merchant.menu

    respond_to do |format|
      if @section.save
        format.turbo_stream
        format.html { redirect_to @section, notice: 'La sección se creó correctamente.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @section.update(section_params)
        format.turbo_stream
        format.html { redirect_to @section, notice: 'La sección se actualizó correctamente.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @section.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to merchant_section_path(@merchant), notice: 'La sección se eliminó correctamente.' }
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

  private

  def set_merchant
    @merchant = Merchant.friendly.find(params[:merchant_id])
  end

  def set_section
    @section = authorize(@merchant.menu.sections.find(params[:id]))
  end

  def section_params
    permitted_attributes(Section)
  end

  def sorted_params
    params.require(:sorted).permit(sections: %i[id position])
  end
end
