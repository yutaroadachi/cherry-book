class Gate
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [150, 190]

  def initialize(name)
    @name = name
  end

  def enter(ticket)
    ticket.stamp(@name)
  end

  def exit(ticket)
    fare = calc_fara(ticket)
    fare <= ticket.fare
  end

  private
  def calc_fara(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    distance = to - from
    FARES[distance - 1]
  end
end
