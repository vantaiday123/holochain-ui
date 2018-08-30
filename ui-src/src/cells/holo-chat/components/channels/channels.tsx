import * as React from 'react';
import {withStyles, Theme, StyleRulesCallback} from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import withRoot from '../../../../withRoot';

const styles: StyleRulesCallback = (theme: Theme) => ({
  root: {
    width: '100%',
    backgroundColor: theme.palette.background.paper
  }
});

interface ChannelsProps {
  classes: any,
  channels: Array<string>
}

class Channels extends React.Component<ChannelsProps, {}> {
  componentDidMount() {
    console.log("get channels")
    // this.props.channelList()
  }

  // tslint:disable jsx-no-lambda
  render() {
    const {classes} = this.props;
    return (<div className={classes.root}>
      <Typography variant='display1'>
        Channels
      </Typography>
      <Typography variant='body1' gutterBottom={true}>
        List of existing channels
      </Typography>

    </div>);
  }
}


export default withRoot(withStyles(styles)(Channels));
