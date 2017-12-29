var React = require('react');
var expect = require('expect');
import { shallow } from 'enzyme';
import { component as NewComponent } from '../'
import Enzyme from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

Enzyme.configure({ adapter: new Adapter() });

describe('NewComponent', function () {
  it('renders without problems', function () {
    const wrapper = shallow(<NewComponent />);
    expect(wrapper.length).toEqual(1)
  });
});