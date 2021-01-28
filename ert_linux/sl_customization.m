function sl_customization(cm)
    cm.ExtModeTransports.add('ert_linux.tlc', 'tcpip', 'ext_comm', 'Level1');
    cm.ExtModeTransports.add('ert_nuttx.tlc', 'tcpip', 'ext_comm', 'Level1');
end
