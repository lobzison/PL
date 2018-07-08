class Hello
    
    def my_first_method
        puts "Hello"
    end

end

x = Hello.new
x.my_first_method

class A
    def n1
        34
    end

    def n2 (x,y)
        z = 7
        if x > y
            false
        else
            x + y * z
        end
    end

end

class B
    def m1
        4
    end

    def m3 x
        x.abs * 2 + self.m1
    end

end

class A1
    def initialize(f=0)
        @foo = f
    end

    def m1
        @foo = 4
    end

    def m2(x)
        @foo += x
    end

    def foo
        @foo
    end
end