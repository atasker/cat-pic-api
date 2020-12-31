class Catpic < ApplicationRecord

	validates_presence_of :image

	before_destroy :remember_id
  after_destroy :remove_id_directory

  mount_uploader :image, ImageUploader

  protected

  def remember_id
    @id = id
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/uploads/#{Rails.env}/#{@id}", force: true)
  end

end
