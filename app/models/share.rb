class Share < ActiveRecord::Base
	has_attached_file :picture, 
	styles: { medium: "300x300>" },
	:storage => :s3,
	:s3_credentials => {
		:bucket => 'Beardstagram',
		:access_key_id => Rails.application.secrets.s3_access_key_id,
		:secret_access_key => Rails.application.secrets.s3_secret_access_key
	}


  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  has_and_belongs_to_many :clips
  belongs_to :user

  def clip_list
  end

  def clip_list=(some_clips)
  	return if some_clips.empty?

 		some_clips.downcase.split(', ').uniq.each do |clip|
 			self.clips << Clip.find_or_create_by(text: clip)
 		end
 	end

 	def price_calc
 			self.price = 0 if self.price == nil
 			self.price.to_i * 100
 	end

end
