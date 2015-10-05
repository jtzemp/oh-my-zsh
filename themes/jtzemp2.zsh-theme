# Personalized! - Based on dallas.zsh-theme

function rvm_with_gemset {
  local gemset=$(~/.rvm/bin/rvm-prompt g)
  local version=$(~/.rvm/bin/rvm-prompt s i v)
  [ "$version" != "" ] && version="$version"
  local full="$version$gemset"
  [ "$full" != "" ] && echo "$full"
}

# Grab the current date (%D) and time (%T) wrapped in {}: {%D %T}
JTZEMP_CURRENT_TIME_="%{$fg[blue]%}[%{$fg[red]%}%T%{$fg[blue]%}]%{$reset_color%}"

# Grab the current version of ruby in use (via RVM): [ruby-1.8.7@rails2]
JTZEMP_CURRENT_RUBY_="%{$fg[blue]%}[%{$fg[red]%}\$(rvm_with_gemset)%{$fg[blue]%}]%{$reset_color%}"

# Grab the current machine name: muscato
JTZEMP_CURRENT_MACH_="%{$fg[green]%}%m%{$fg[white]%}:%{$reset_color%}"

# Grab the current filepath, use shortcuts: ~/Desktop
# Append the current git branch, if in a git repository: ~aw@master
JTZEMP_CURRENT_LOCA_="%{$fg[cyan]%}%~\$(git_prompt_info)\$(svn_prompt_info)%{$reset_color%}"

# Grab the current username
JTZEMP_CURRENT_USER_="%{$fg[green]%}%n@%{$reset_color%}"

# Use a % for normal users and a # for privelaged (root) users.
JTZEMP_PROMPT_CHAR_="%{$fg[white]%}%(!.#.%%)%{$reset_color%}"

# For the git prompt, use a white @ and blue text for the branch name
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}git:(%{$fg[cyan]%}"

# Close it all off by resetting the color and styles.
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%}"

# Do nothing if the branch is clean (no changes).
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Add 3 red ✗s if this branch is diiirrrty! Dirty branch!
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗✗✗"

# ZSH_THEME_SVN_PROMPT_PREFIX=" %{$fg[blue]%}svn:(%{$fg[cyan]%}"
# ZSH_THEME_SVN_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
# ZSH_THEME_SVN_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
# ZSH_THEME_SVN_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN

# Put it all together!
PROMPT="$JTZEMP_CURRENT_TIME_$JTZEMP_CURRENT_RUBY_ $JTZEMP_CURRENT_USER_$JTZEMP_CURRENT_MACH_$JTZEMP_CURRENT_LOCA_ %(50l.
.)$JTZEMP_PROMPT_CHAR_ "
