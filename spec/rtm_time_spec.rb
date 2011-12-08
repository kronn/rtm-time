# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe RtmTime do
  describe 'only integer' do
    context '2h15m' do
      subject {
        RtmTime::Ja.parse( '2h15m' ).to_hash
      }
      it {
        should == {:day => nil, :hour => 2, :min => 15}
      }
    end

    context ' 2 hrs 15 min ' do
      subject {
        RtmTime::Ja.parse( ' 2 hrs 15 min ' ).to_h
      }
      it {
        should == {:day => nil, :hour => 2, :min => 15}
      }
    end

    context '2時間および15分' do
      subject {
        RtmTime::Ja.parse( '2時間および15分' ).to_h
      }
      it {
        should == {:day => nil, :hour => 2 , :min => 15}
      }
    end

    context '15分と2時間' do
      subject {
        RtmTime::Ja.parse( '15分と2時間' ).to_h
      }
      it {
        should == {:day => nil, :hour => 2, :min => 15}
      }
    end
  end

  describe 'float' do
    context '1.2h' do
      subject {
        RtmTime::Ja.parse( '1.2h' ).to_h
      }
      it {
        should == {:day => nil, :hour => 1, :min => 12}
      }
    end

    context '1h' do
      subject {
        RtmTime::Ja.parse( '1h' ).to_h
      }
      it {
        should == {:day => nil, :hour => 1, :min => 0}
      }
    end

    context '10m 1.5h ' do
      subject {
        RtmTime::Ja.parse( '10m 1.5h ' ).to_h
      }
      it {
        should = {:day => nil, :hour => 1, :min => 40}
      }
    end
  end
end
