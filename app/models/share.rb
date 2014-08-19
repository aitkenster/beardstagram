class Share < ActiveRecord::Base
	has_attached_file :picture, 
	styles: { medium: "300x300>" },
	:storage => :s3,
	:s3_credentials => {
		:bucket => 'beardstagram',
		:access_key_id => Rails.application.secrets.s3_access_key_id,
		:secret_access_key => Rails.application.secrets.s3_secret_access_key_id
	}


  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  has_and_belongs_to_many :clips

  def clip_list
  end

  def clip_list=(some_clips)
  	return if some_clips.empty?

 		some_clips.split(', ').uniq.each do |clip|
 			self.clips << Clip.find_or_create_by(text: clip)
 		end
 	end

end
