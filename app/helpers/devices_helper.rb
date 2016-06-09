module DevicesHelper
  def ftrame_type_name(id)
    DisplayFrame.find_by(id).name
  end
end
