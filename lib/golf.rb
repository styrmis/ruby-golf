class Golf
  class << self
    def hole1(s)
      s.split(/(?=[A-Z])/).map(&:downcase).join("_")
    end

    def hole2(b)
      l,h=b
      (l..h).to_a.select {|s| s.to_s.reverse == s.to_s }.uniq
    end

    def hole3(s,n)
      s.tr('a-z', "#{(97+n).chr}-za-{(96+n).chr}")
    end

    def hole4(s,f)
      s.scan(/#{f}/i).count
    end

    def hole5(l,h)
      (l+1..(h)).lazy.select{|i|!(2...i).any?{|j|i%j==0}}.to_a.inject(:+)
    end

    def hole6(m)
      (1..m).collect { |n| n%15==0?'fizzbuzz':n%3==0?'fizz':n%5==0?'buzz':n }
    end

    def hole7(j)
      s = ->h {
        Hash === h ? 
          Hash[
            h.map do |k, v| 
              [k.respond_to?(:to_sym) ? k.to_sym : k, s[v]] 
            end 
          ] : h 
      }

      s[j]
    end

    def hole8(n)
      f = ->(x){ x < 2 ? x : f[x-1] + f[x-2] }
      1.upto(n).collect {|i| f[i]}
    end

    def hole9(l)
      l.unshift(0).each_cons(2).slice_before{|m, n| m + 1 < n}.map{|a| a.map(&:last)}.collect {|o| o.min == o.max ? o[0].to_s : "#{o.min}-#{o.max}"}
    end
  end
end
