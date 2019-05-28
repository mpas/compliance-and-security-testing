describe file('/etc/myapp.conf') do
    it { should exist }
    its ('mode') { should cmp '0644' }
end