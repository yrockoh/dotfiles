# 로케일/IME는 .zshenv에서 설정 (Linux 터미널 한글)

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# 플러그인 로드
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker)

source $ZSH/oh-my-zsh.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# 기본 에디터
export EDITOR='nvim'

# 커스텀 Alias 로드 (심볼릭 링크를 따라가서 dotfiles 위치 자동 감지)
_aliases_dir="${HOME}/.zshrc"
_aliases_dir="${_aliases_dir:A:h}"  # :A resolves symlinks, :h gets dirname
if [ -f "$_aliases_dir/aliases.zsh" ]; then
    source "$_aliases_dir/aliases.zsh"
elif [ -f "$HOME/dotfiles/zsh/aliases.zsh" ]; then
    source "$HOME/dotfiles/zsh/aliases.zsh"
elif [ -f "$HOME/.dotfiles/zsh/aliases.zsh" ]; then
    source "$HOME/.dotfiles/zsh/aliases.zsh"
fi

# 머신별·개인 설정 (토큰, 사내 서버 alias 등) — repo에 커밋되지 않음, 마지막에 읽어 위 설정 덮어쓰기 가능
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
