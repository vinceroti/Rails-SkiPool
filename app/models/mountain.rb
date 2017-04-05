class Mountain < ApplicationRecord
  validates :pws_id, :name, :latitude, :latitude, presence: true

  def live_image
    webcam_image_response = JSON.parse(open("https://webcamstravel.p.mashape.com/webcams/list/nearby=#{self.latitude},#{self.longitude},5?show=webcams:image",
    "X-Mashape-Key" => ENV['CAM']).read)
    return webcam_image_response["result"]["webcams"][0]["image"]["current"]["preview"]
  end


  def live_timelapse
    webcam_timelaspe_response = JSON.parse(open("https://webcamstravel.p.mashape.com/webcams/list/nearby=#{self.latitude},#{self.longitude},5?show=webcams:timelapse",
    "X-Mashape-Key" => ENV['CAM']).read)
    first_cam = webcam_timelaspe_response["result"]["webcams"][0]
    return { link: first_cam["timelapse"]["day"]["link"], title: first_cam["title"] }
  end
end
