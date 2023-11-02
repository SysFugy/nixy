def banner
  puts
  puts <<-BANNER
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
end

def install
  print "     [Package name]: "
  package = gets.chomp.downcase
  system("nix-env -iA nixos.#{package}")
  puts "     [Success!]"
  sleep(0.5)
  start
end

def updatep
  system("nix-env -u")
  puts "     [Success!]"
  sleep(0.5)
  start
end

def delete
  print "     [Package name]: "
  package = gets.chomp.downcase
  system("nix-env -e #{package}")
  puts "     [Success!]"
  sleep(0.5)
  start
end

def temp
  system("nix-serve")
  puts "     [Success!]"
  sleep(0.5)
  start
end

def build
  print "     [Path to .nix file]: "
  package = gets.chomp.downcase
  system("nix-build #{package}")
  puts "     [Success!]"
  sleep(0.5)
  start
end

def garb
  system("nix-collect-garbage -d")
  puts "     [Success!]"
  sleep(0.5)
  start
end

def updater
  system("nix-update")
  puts "     [Success!]"
  sleep(0.5)
  start
end

def start
  system("clear")
  banner
  puts "     ┌─[Enter option]: \n     │"
  options = {
    "1": "Install packages",
    "2": "Update package",
    "3": "Delete package\n     │",         
    "4": "Launch HTTP",
    "5": "Build .nix file",
    "6": "Collect garbage",
    "7": "Update repositories",
    "X": "Exit"
  }

  options.each do |key, value|
    puts "     ├─[#{key}]. #{value}"
  end

  print "     │\n     └─[X]: "
  choice = gets.chomp.to_s

  case choice.to_sym
  when :"1"
    install
  when :"2"
    updatep
  when :"3"
    delete
  when :"4"
    temp
  when :"5"
    build
  when :"6"
    garb
  when :"7"
    updater
  when :"X"
    exit
  else
    puts "Error! Invalid input!"
    sleep(0.5)
  end
end


start while true
