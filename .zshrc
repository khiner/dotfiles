export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster" # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
plugins=(git dotenv osx)
source $ZSH/oh-my-zsh.sh

export EDITOR=subl

prompt_context() {
  # Custom (Random emoji)
  emojis=("⚡️" "🔥" "💀" "👑" "😎" "🐸" "🐵" "🦄" "🌈" "🍻" "🚀" "💡" "🎉" "🔑" "🇹🇭" "🚦" "🌙")
  RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1))
  prompt_segment black default "${emojis[$RAND_EMOJI_N]} "
}

# Always ls after cd
function cd {
	builtin cd "$@" && ls -F
}

alias video_to_gif='function video_to_gif(){ ffmpeg -i $1 $2 && gifsicle -O3 $2 -o $2 && say "Video is ready!"};video_to_gif'

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/.nvm/nvm.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# See https://github.com/pyenv/pyenv/issues/1722
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

export PATH=$PATH:/Applications/Julia-1.8.app/Contents/Resources/julia/bin

export PATH="/opt/homebrew/opt/ffmpeg@4/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ffmpeg@4/lib -L/opt/homebrew/opt/libomp/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ffmpeg@4/include -I/opt/homebrew/opt/libomp/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ffmpeg@4/lib/pkgconfig"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++ $LDFLAGS"

alias gs="git status"
alias glp="git log -p"

export VULKAN_SDK="$HOME/VulkanSDK/1.3.250.0/macOS"
export DYLD_LIBRARY_PATH=/usr/local/lib:$DYLD_LIBRARY_PATH

# E.g. `vulkan_sample hello_triangle`
vulkan_sample() {
  (
    cd /Users/khiner/Development/Vulkan-Samples || return 1
    ./build/mac/app/bin/Release/arm64/vulkan_samples sample "$@"
  )
}
