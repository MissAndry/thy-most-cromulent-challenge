class Parser
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @parsed = parsed
    @ye_olde_columne_one = ye_olde_columne_one
    @ye_olde_columne_two = ye_olde_columne_two
    @ye_olde_columne_three = ye_olde_columne_three
  end

  def parsed
    @parsed ||= File.readlines(filename).map{ |insult| insult.strip }
  end


  def generate_insult
    checker
    insults = []

    insults << ye_olde_columne_one.sample
    insults << ye_olde_columne_two.sample
    insults << ye_olde_columne_three.sample

    return "Thou #{insults.join(" ")}!"
  end

  def ye_olde_columne_one
    @ye_olde_columne_one ||= ye_olde_columnes(1)
  end

  def ye_olde_columne_two
    @ye_olde_columne_two ||= ye_olde_columnes(2)
  end

  def ye_olde_columne_three
    @ye_olde_columne_three ||= ye_olde_columnes(3)
  end

  def checker
    if @ye_olde_columne_three[-1] == "artless"
      @ye_olde_columne_three.pop
    end
  end

  def ye_olde_columnes(columne)
    columne_arre =[]
    target_lengthe = @parsed.length/3

    if columne == 2 
      target_lengthe += 2 # this is unfortunate and depends on the site never changing
    end
    
    until columne_arre.length == target_lengthe
      columne_arre << @parsed[columne - 1]
      @parsed.rotate!(3)
    end

    if @parsed.first != "artless" # also unfortunately depends on the file never changing
      @parsed.rotate! until @parsed.first == "artless"
    end

    columne_arre
  end
end