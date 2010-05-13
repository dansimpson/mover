class Fixnum

    def years
        days * 365    
    end

    def weeks
        days * 7
    end

    def days
        hours * 24
    end

    def hours
        minutes * 60   
    end

    def minutes
        seconds * 60   
    end

    def seconds
        self    
    end

end
