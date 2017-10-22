class CharacterAttributesController < ApplicationController
  before_action :set_char_attr, only: [:edit, :update]
  def create
    @character = CharacterType.find(params[:character_type_id])
    @character.character_attributes.create(character_attributes_params)
    redirect_to @character
  end

  def edit
  end

  def update
    if @character_attribute.update(character_attributes_params)
      redirect_to @character
    end
  end

  private

  def character_attributes_params
    params.require(:character_attribute).permit(:name, :numerical_value)
  end

  def set_char_attr
    @character = CharacterType.find(params[:character_type_id])
    @character_attribute = @character.character_attributes.find(params[:id])
  end
end