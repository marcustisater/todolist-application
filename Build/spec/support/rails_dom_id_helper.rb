module RailsDomIdHelper

  def dom_id_for(model)
      ["#", ActionView::RecordIndentifier.dom_id(model)].join
  end

end 