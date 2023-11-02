def disbanner
  banner = <<~BANNER
     ██████   █████  ███                        
    ░░██████ ░░███  ░░░                         
     ░███░███ ░███  ████  █████ █████ █████ ████
     ░███░░███░███ ░░███ ░░███ ░░███ ░░███ ░███ 
     ░███ ░░██████  ░███  ░░░█████░   ░███ ░███ 
     ░███  ░░█████  ░███   ███░░░███  ░███ ░███ 
     █████  ░░█████ █████ █████ █████ ░░███████ 
    ░░░░░    ░░░░░ ░░░░░ ░░░░░ ░░░░░   ░░░░░███ 
                                        ███ ░███ 
                                       ░░██████  
                                        ░░░░░░   
  BANNER
  puts banner
end

def install
  print "Enter package name: "
  pack = gets.chomp.downcase
  begin
    system("nix-env -iA nixos.#{pack}")
  rescue
    puts "Error! Cannot load this package!"
  end
end

def main
  loop do
    system("clear")
    disbanner
    install
  end
end

main
