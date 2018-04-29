const React = require('react');
const ReactDOM = require('react-dom');

export class Root extends React.Component {
    constructor() {
        super();

        this.state = {
            state: 'Alabama'
        };
    }

    handleChangeState(event) {
        const newState = event.target.value;
        this.setState({ 
            state: newState
        });
    };

    render() {
        return <div style={{ height: '100px' }} className='blue-grey darken-4'>
            <Materialize />
            <Navbar />
            <MaterializeJS />
            <div className='container'>
                <h4 className='center-align'>
                    Pick a state to see it in the map.
                </h4>
                <StateDropdown />
                <StateMap state={this.state.state} />
            </div>
        </div>;
    }
}

ReactDOM.render(
    <Root/>,
    document.getElementById('react-anchor')
);

