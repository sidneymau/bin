#/usr/bin/env bash

__bin=$HOME/bin
mkdir -p -v ${__bin}

scripts=(
	journal
	notes
)

for script in "${scripts[@]}"; do
	if [[ -L $__bin/$script ]]; then
		target=$(readlink -fv $script)
		printf "'%s' is '%s'\n" "$__bin/$script" "$target"
	else
		if [[ -d $__bin/$script && ! -L $__bin/$script ]]; then
			rm -irv "$__bin/$script"
		fi
		ln -sv "$PWD/$script" "$__bin/$script"
	fi
done
