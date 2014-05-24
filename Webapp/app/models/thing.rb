class Thing < ActiveRecord::Base
  attr :energy, :cost

  validates_presence_of :name, :watts
  validates :name, uniqueness: true
  validates_numericality_of :watts, :time

  def energy
    # Take milliseconds as seconds
    (self.time / 60) * (self.watts * 0.001) # kWh

    # Take milliseconds as milliseconds
    # (self.time / 3600000) * (self.watts * 0.001) # kWh
  end

  def cost
    energy * Sap.find(1).price # Euros
  end
end
