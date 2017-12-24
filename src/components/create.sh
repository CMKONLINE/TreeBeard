bold=$(tput bold)
normal=$(tput sgr0)

echo "The Magical Creator has been Awoken. What would you like to create?"
echo " 1. ${bold}component [c]${normal}"
echo " 2. ${bold}container [ct]${normal}"
echo " 3. ${bold}reducer [r]${normal}"
echo  " 4. ${bold}action [a]${normal}"
read type 
if [ $type == "1"  -o  $type == "component"  -o $type == "c" ];
    then echo "Okay, what would you like to name the Component?"
    read componentName
    echo "Creating Component : $componentName"
    echo "What directory does this component live (leave blank for cwd)"
    read directory
    if [ $directory ];
        then cd $directory
    fi
    mkdir $componentName && cd $componentName
    touch index.js
    touch "$componentName.js"
    echo "import React, { Component } from 'react';
    import PropTypes from 'prop-types';

    export default class $componentName extends Component{
        constructor(){
            super();
        }

        render(){
            return <div>$componentName component</div>
        }
    }

    //Prop Definitions for this component
    $componentName.propTypes = {}" >> $componentName.js
    echo "export { component } from './$componentName';" >> index.js
    echo "Finished creating Component : $componentName"
fi

if [ $type == "2"  -o  $type == "container"  -o $type == "ct" ];
    then echo "Okay, what's then name of the component that this container attaches to?"
    read componentName
    echo "What directory does this component live (leave blank for cwd)"
    read directory
     if [ $directory ];
        then cd $directory
    fi
    cd $componentName
    touch container.js
    echo "export { container } from './container.js'" >> index.js
    echo "Finished creating a container for component $componentName"
fi

if [ $type == "3"  -o  $type == "reducer"  -o $type == "r" ];
    then echo "Okay, what's then name of the component that this reducer attaches to?"
    read componentName
    echo "What directory does this component live (leave blank for cwd)"
    read directory
    if [ $directory ];
        then cd $directory
    fi
    cd $componentName
    touch reducer.js
    echo "export { reducer } from './reducer.js'" >> index.js
    echo "Finished creating a reducer for component $componentName"
fi

if [ $type == "4"  -o  $type == "action"  -o $type == "a" ];
    then echo "Okay, what's then name of the component that this action attaches to?"
    read componentName
    echo "What directory does this component live (leave blank for cwd)"
    read directory
    if [ $directory ];
        then cd $directory
    fi
    cd $componentName
    if [ ! -d 'actions' ];
        then mkdir actions && touch actions/index.js
    fi
    cd actions
    echo "What is the name of the action that you wish to create?"
    read actionName
    mkdir $actionName
    touch "$actionName/index.js"
    touch "$actionName/$actionName.js"
    echo "export { $actionName } from './$actionName'" >> 'index.js'
fi

